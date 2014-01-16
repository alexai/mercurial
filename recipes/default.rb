#
# Cookbook Name:: mercurial
# Recipe:: default
#
# Copyright 2014, Demandforce, Inc.
#
# Mailto: yai@dfengg.com
#

#Install  python-hglibs from source.
script "install_hglib" do
        interpreter "bash"
        user "root"
        cwd "/root"
        action :nothing
        code <<-EOH
                tar zxvf #{node.ag.hg.pylib}
                cd python-hglib-0.1
                python setup.py install        
EOH
end

#Install Mercurial-2.2.3 from source.
script "install_hg223" do
        interpreter "bash"
        user "root"
        cwd "/root"
        action :nothing
        code <<-EOH
                tar zxvf "#{node.ag.hg.src_pkg}"
                cd mercurial-2.2.3
                rpm -qa |grep python-devel
                [ "$?" -ne "0" ] &&  yum install -y python-devel ||  echo "Python-devel installed" 
                rpm -qa |grep python-docutils
                [ "$?" -ne "0" ] && yum install -y python-docutils || echo "Python-docutils installed"
                make 
                make install
EOH
end

#Download python hglibs.
remote_file "/root/#{node.ag.hg.pylib}" do
        source "http://mercurial.selenic.com/release/python-hglib/python-hglib-0.1.tar.gz"
        action :create_if_missing
        notifies :run, "script[install_hglib]", :immediately
end 

#Download Mercurial-2.2.3 source ball.
remote_file "/root/#{node.ag.hg.src_pkg}" do
        source "http://mercurial.selenic.com/release/mercurial-2.2.3.tar.gz"
        action :create_if_missing
        notifies :run, "script[install_hg223]", :immediately
end
