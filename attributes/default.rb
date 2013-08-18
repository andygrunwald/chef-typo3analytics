#
# Cookbook Name:: typo3analytics
# Attributes:: default
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

# Directory of composer-file to update
default[:typo3analytics][:composer_file_dir] = "/var/www/analysis"

# Directory where downloaded data will be stored
default[:typo3analytics][:data_dir] = "/var/www/analysis/data/TYPO3"

# Directory to store the log files
default[:typo3analytics][:log_dir] = "/var/log/analysis"

# MySQL settings
default[:typo3analytics][:mysql_bin] = "/usr/bin/mysql"

# MySQL user
default[:typo3analytics][:mysql_user][:username] = "analysis"
default[:typo3analytics][:mysql_user][:password] = "analysis"
default[:typo3analytics][:mysql_user][:database] = "typo3"

# Gerrie settings
default[:typo3analytics][:gerrie_dir] = "/var/www/analysis/vendor/andygrunwald/Gerrie"
default[:typo3analytics][:gerrie_configfile] = "/var/www/analysis/Config/gerrit-review.typo3.org.yml"

# SSH Keys
default[:typo3analytics][:ssh_keys_dir] = "/var/www/analysis/Config"

# Binaries
default[:typo3analytics][:console_bin] = "/var/www/analysis/console"