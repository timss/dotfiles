function myip --description "Get public (internet) IP"
    command wget ipecho.net/plain -O - -q; echo;
end
