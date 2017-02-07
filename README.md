# README
## DataBase design

###Users_Tabele
| User_id | Name | Email |
|:-------:|:----:|:-----:|
| 1234    | abe  | aa@com|

###migrate_file
create_table:users do |t|  
t.integer :user_id  
t.string  :name,null : false  
t.sting   :email,null : false  

 add_index :users, :name,unique:true  
 add_index :users, :email,unique:true  
 add_index :users, :user_id  

###Messages_Table
| Messege_id | Body  | Image | User_id | Gorup_id |
|:----------:|:-----:|:-----:|:-------:|:--------:|
|   56789    | great | a.jpg |  1234   |  10123   |

###miglate_file
create_table:messeges do |t|  
t.integer :message_id  
t.text    :body  
t.text    :image  
t.integer :user_id  
t.integer :group_id  


###Groups_Table
| Group_id | Group_name |
|:--------:|:----------:|
|   10123  |  group1    |

###migrate_file
create_table:groups do |t|  
t.integer :group_id  
t.string  :group_name,null : false  
