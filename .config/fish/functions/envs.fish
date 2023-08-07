function envs --description "List common custom environment variables"
    command env | grep -iE "(openstack|os_|ansible|pypi|pip|requests|restic)";
end
