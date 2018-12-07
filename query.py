import os
import mysql.connector

config = {
    'user': 'hstud',
    'password': 'gkrtod123A!',
    'host': 'localhost',
    'database': 'hdbwork'
}

def query(dirname):
    list = []
    for (path, dir, files) in os.walk(dirname):
        for filename in files:
            ext = os.path.splitext(filename)[-1]
            if ext == '.jpg' or ext == '.gif':
                parent_dir = path.split('/')[-1]
                img_dir = './img/' + parent_dir + '/'+ filename
                list.append(img_dir)

    return list

if __name__ == '__main__':
    l = query('/home/suho/Workspace/Lecture/webserver_programming/project/')

    db = mysql.connector.connect(**config)
    qry = db.cursor()
    add_query = ("INSERT INTO s20131517p "
                 "(url, tag) "
                 "VALUES (%s, %s)")

    for path in l:
        data = (path, path.split('/')[2])
        qry.execute(add_query, data)

    db.commit()
    qry.close()
    db.close()

