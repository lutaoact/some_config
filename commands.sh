sudo yum groupinstall 'Development Tools'

sudo yum install ncurses-devel

#install perl
sudo ./Configure -des -Dprefix=/usr
make
make test
sudo make install

#install git
sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
sudo yum install asciidoc xmlto
sudo yum install openjade opensp texinfo 'perl(XML::SAX::ParserFactory)'
sudo rpm -ivh docbook2X-0.8.8-2.1.i686.rpm
sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
make prefix=/usr all doc info
sudo make prefix=/usr install install-doc install-html install-info
