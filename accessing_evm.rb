#!/usr/bin/ruby

$evm = MiqAeMethodService::MiqAeService.new(MiqAeEngine::MiqAeWorkspaceRuntime.new)

10.downto(1) { |i| puts "Countdown: #{i}" }



# This section list miq service request bundle
miq_requests = $evm.vmdb('miq_request').all
miq_requests.each do |this_miq_request|
  # Here comes the name of the service
 if this_miq_request.message.include?("EC2 Instance Provisioning")
    puts "::: Service Name: #{ this_miq_request.message } ::: Service ID: #{ this_miq_request.id } ::: Service Status: #{ this_miq_request.status }"
  end
end


# This section list the existing service templates or service catalogs items
message = ""
services = $evm.vmdb('service_template').all
services.each do |service|
  message <<  "::: Template: #{ service.name }  Template ID:  #{ service.id } \n"
end

message.each_line do |line|
  unless line.scan(/Template.*/).empty?
    puts line
  end
end



# Print tags categories
message = ""
$evm.vmdb(:classification).categories.each do |category|
  message << "Category: #{category.name} ::: Description: {category.description} \n"
end
print message



# Print a list of existing VMs objects ##
values_hash = {}
values_hash['!'] = '-- select from list --'
vms_inventory = $evm.vmdb('vm').all

vms_inventory.each do |this_vms_inventory|
   # This bit will register each VM object in a hast table
   #values_hash[this_vms_inventory.name] = this_vms_inventory.name
   print this_vms_inventory.name + "\n"
end



# Print a list of existing EMS ##
values_hash = {}
values_hash['!'] = '-- select from list --'
ems_inventory = $evm.vmdb('ems').all

ems_inventory.each do |this_ems_inventory|
   # This bit will register each VM object in a hast table
   #values_hash[this_vms_inventory.name] = this_vms_inventory.name
   puts "EMS Name: " + this_ems_inventory.name + "  :::  " + "EMS ID: " + this_ems_inventory.id.to_s
end



# Print a list of existing reports ##
values_hash = {}
values_hash['!'] = '-- select from list --'
reports_inventory = $evm.vmdb('miq_report').all

reports_inventory.each do |this_reports_inventory|
   puts "Report Name: " + this_reports_inventory.name + "  :::  " + "Report ID: " + this_reports_inventory.id.to_s
end


# Print a list of existing users ##
values_hash = {}
values_hash['!'] = '-- select from list --'
users_inventory = $evm.vmdb('user').all

users_inventory.each do |this_users_inventory|
   puts "User Name: " + this_users_inventory.name + "  :::  " + "User ID: " + this_users_inventory.id.to_s
end


# Print a list of VSwitches ##
values_hash = {}
values_hash['!'] = '-- select from list --'
hosts_inventory = $evm.vmdb(:Host).all

hosts_inventory.each do |this_host|
values_hash[this_vms_inventory.name] = this_vms_inventory.name
  this_host.switches.each do |this_host_switch|
    print this_host_switch[0].name
  end
end



## Print a list of VLans ##
values_hash = {}
values_hash['!'] = '-- select from list --'
hosts_inventory = $evm.vmdb(:Host).all

hosts_inventory.each do |this_host|
  this_host.lans.each do |this_host_lans|
    # This bit register each lans object in a hast table
    # values_hash[this_host_lans.name] = this_host_lans.name + " (" + ")"
    print this_host_lans.name + "\n"
  end
end



# Print a list of VLans specifically for VMWare##
values_hash = {}
values_hash['!'] = '-- select from list --'
hosts_inventory = $evm.vmdb('Host').all

hosts_inventory.each do |this_host|
  next if this_host.type != "ManageIQ::Providers::Vmware::InfraManager::HostEsx"
    this_host.lans.each do |this_host_lans|
      #print this_host_lans.name + " (" + this_host_lans.switch.name + ")" + "\n"
      values_hash[this_host_lans.name] = this_host_lans.name
    end
end
values_hash.each do |key, value|
    puts key + ' : ' + value
end
