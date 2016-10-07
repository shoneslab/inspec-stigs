# encoding: utf-8
# copyright: 2016, you
# license: All rights reserved
# date: 2015-05-26
# description: The Red Hat Enterprise Linux 6 Security Technical Implementation Guide (STIG) is published as a tool to improve the security of Department of Defense (DoD) information systems.  Comments or proposed revisions to this document should be sent via e-mail to the following address: disa.stig_spt@mail.mil.
# impacts

title 'V-38519 - All rsyslog-generated log files must be group-owned by root.'

control 'V-38519' do
  impact 0.5
  title 'All rsyslog-generated log files must be group-owned by root.'
  desc '
The log files generated by rsyslog contain valuable information regarding system configuration, user authentication, and other such information. Log files should be protected from unauthorized access.
'
  tag 'stig','V-38519'
  tag severity: 'medium'
  tag checkid: 'C-46076r2_chk'
  tag fixid: 'F-43466r1_fix'
  tag version: 'RHEL-06-000134'
  tag ruleid: 'SV-50320r2_rule'
  tag fixtext: '
The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [LOGFILE] referenced in "/etc/rsyslog.conf", run the following command to inspect the file\'s group owner:

$ ls -l [LOGFILE]

If the owner is not "root", run the following command to correct this:

# chgrp root [LOGFILE]
'
  tag checktext: '
The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". To see the group-owner of a given log file, run the following command:

$ ls -l [LOGFILE]

Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration.

If the group-owner is not root, this is a finding.
'

# START_CHECKS
  # describe file('/etc') do
  #  it { should be_directory }
  #end
# END_CHECKS
end