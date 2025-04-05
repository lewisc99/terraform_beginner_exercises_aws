%# 
%# This template code is used to dynamically generate backend configurations
%# for a service by iterating over a list of IP addresses (`ip_addrs`) and
%# appending a specified port (`port`) to each address.
%#
%# - `%{ for addr in ip_addrs }`: Begins a loop over the `ip_addrs` list.
%# - `backend ${addr}:${port}`: Generates a backend configuration line.
%# - `%{ endfor }`: Ends the loop.
%#
%# This template is commonly used in load balancer configurations.
%#

%{ for addr in ip_addrs }
backend ${addr}:${port}
%{ endfor }
