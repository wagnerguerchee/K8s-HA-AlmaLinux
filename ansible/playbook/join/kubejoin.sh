  kubeadm join 192.168.56.30:6443 --token d3a9nu.xmdmjb3vknszkzve \
	--discovery-token-ca-cert-hash sha256:f5036f8954dcec0c35858e8d31c51a362a5cb0ab5be66f89da6b33d686f34f90 \
	--control-plane --certificate-key b5c895e5a8ffdf13ee1f98b241709ec5bc532e23f7a7db7e6fe5ca4060e94dc0

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"kubeadm init phase upload-certs --upload-certs" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 192.168.56.30:6443 --token d3a9nu.xmdmjb3vknszkzve \
	--discovery-token-ca-cert-hash sha256:f5036f8954dcec0c35858e8d31c51a362a5cb0ab5be66f89da6b33d686f34f90 