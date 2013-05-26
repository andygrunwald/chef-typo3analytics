#
# Cookbook Name:: typo3analytics
# Recipe:: ssh
#
# Copyright 2013, Andy Grunwald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "ssh_known_hosts"

# Manually SSH Key deployment
# There must be a better way ... If you know one
# Please let me know
keysToDeploy = %w(id_rsa id_rsa.pub)

keysToDeploy.each do |keyfile|
	file "/home/vagrant/.ssh/#{keyfile}" do
		content IO.read("/vagrant/Credentials/#{keyfile}")
	end
end

# Set correct system rights
execute "correct-rights-id_rsa" do
	command "chmod 0600 /home/vagrant/.ssh/id_rsa"
	only_if "[ -f /home/vagrant/.ssh/id_rsa ] || exit 1"
end

execute "correct-rights-id_rsa.pub" do
	command "chmod 0644 /home/vagrant/.ssh/id_rsa.pub"
	only_if "[ -f /home/vagrant/.ssh/id_rsa.pub ] || exit 1"
end

# Start ssh-agent
execute "eval-ssh-agent" do
	command "eval `ssh-agent`"
end

# Add ssh known hosts
ssh_known_hosts "review.typo3.org"