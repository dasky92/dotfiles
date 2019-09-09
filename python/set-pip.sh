if [ -d ~/pip ]; then
	echo "WARNING: ~/pip existed."
else
	mkdir ~/pip
	echo "WARNING: mkdir pip"
fi
if [ ! -f ~/pip/pip.conf ]; then
    cp pip.conf ~/pip/
fi
echo "CONGRATULATION: douban source set successfully."
