
load file from csv{
    1:{
    load data local infile "/home/xyz.csv" into table xxx 
	 fields terminated by ','
	 lines terminated by '\n'
	 ignore 1 lines
	 (col1,col2,col3.....)
	set col3=str_to_date(@datevar,'%m/%d/%Y') 
    }

},

Run mysql in Docker{
    
    run command:{
     docker run \
      --name xyzdb \
      -v /home/xyz/mysql/conf.d:/etc/mysql/conf.d \ \\ mount document conf.d to container for configure params
      -v /home/xyz/mysql/initdb.d:/docker-entrypoint-initdb.d \ \\ some .sql file in document initdb.d for initial mysql      -v /home/xyz/mysql/data:/var/lib/mtsql \ \\store some data 
      -e MYSQL_ROOT_PASSWORD=1234 \
      -d mysql
    },
    
    startup:{
      1:putting .sh .sql or sql.gz file in document initdb.d will cause their execution on cantainer startup
      2:override the folder docker-entrypoint-initdb.d in container 
    },

    conf{
        overide folder /etc/mysql/conf.d with host mysql configue file
    },
}

Save database from container to host{

    save database {sudo docker exec mysql sh -c "exec mysqldump --all databases -uroot -p'$MYSQL_ROOT_PASSWORD'" \
        > /home/xyz/mysql/dumps/all-databases.sql
    },

    resotre data{
    
        make use of /home/xyz/mysql/initdb.d
        copy sql files into it and container will autorun it when startup
    },
}

normalUse{

    //mysql like a document folder
    // database like some xls files in mysql folder
    // table like some sheets in one xls file
    // all xls files are open, choose a file to use
    //use a database like open a xls file but also can copy data from other xls file cause all files open
    
    about databses:{
    
    1:show databases;
    2:create databaes if not exists xyzdb character set utf8;
    3:use xyzdb; // use a database and not need to quit , just use the other database 
                // and can select data from other databaes in one perticular databaes
    4:drop database if exists xyzdb;
    5:mysqladmin -uroot -p commands above //mysqladmin like sudo , if user is not root logging in 
    
    }




}




