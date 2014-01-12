DB_NAME="rosebud2_intranet"
DB_SCHEMA="av_mocheckso"


sudo -u postgres psql -d $DB_NAME -c "DROP SCHEMA IF EXISTS $DB_SCHEMA CASCADE;"
sudo -u postgres psql -d $DB_NAME -f 02a_mocheckso.sql
