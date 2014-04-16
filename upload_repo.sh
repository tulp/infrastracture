#/bin/sh
knife cookbook -o ./vendor/cookbooks upload -a

knife data bag create users
knife data bag from file users ./tulp_repo/databags/users/tulp.json
knife data bag from file users ./tulp_repo/databags/users/admin.json

knife data bag create psql_tulp_master
knife data bag from file psql_tulp_master ./tulp_repo/databags/psql_tulp_master/users.json
knife data bag from file psql_tulp_master ./tulp_repo/databags/psql_tulp_master/databases.json

knife role from file ./tulp_repo/roles/*.rb

knife environment from file ./tulp_repo/environments/*.rb


knife bootstrap 188.226.201.195 -N db-master-1 -r 'role[base],role[postgresql-master]' -x root -E production-do

