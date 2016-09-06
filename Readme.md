# Dnsmasq for Docker Cloud

Docker Cloud embedded DNS resolvers for nodes running Docker 1.11 seem to "crash" if presented with too many queries, especially if the responses take more than a few dozen milliseconds (or so it seems).  Once crashed, all subsequent queries take 4-5 seconds to complete.

To mitigate this issue, I created a local DNS caching server which bypasses the embedded resolver for all external lookups using dnsmasq. Internal lookups are still routed to the embedded DNS so local name lookups should still work.  Doing this seems to have eliminated the issues I was experiencing.    

I created a stack called `dnsmasq` that contains a service also called `dnsmasq`.  For an application service to use the dnsmasq server, a link must be created.  The notation is `stackname.imagename:alias` 

See `example application/app-stack.yml` :

    links:
        - 'dnsmasq.dnsmasq:dnsmasq'

Since Docker Cloud creates/changes the application image's `resolv.conf` file on deployment, we must edit it to point at the dnsmasq server at runtime.  See `example application/Dockerfile` and `example application/run.sh`

I created this quickly to solve my problem but it could be improved to allow setting the nameservers or any of the dnsmasq settings using environment variables, etc.  Please feel free to submit pull requests.
