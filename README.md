# README
## DataBase design

###Users_Tabele
| id | Name | Email |
|:--:|:----:|:-----:|
| 12 | abe  | aa@com|

###migrate_file
create_table:users do |t|  
t.integer :user_id  
t.string  :name,null : false  
t.sting   :email,null : false  

 add_index :users, :name,unique:true  
 add_index :users, :email,unique:true  
 add_index :users, :user_id  

###Messages_Table
| id | Body  | Image | User_id | Gorup_id |
|:--:|:-----:|:-----:|:-------:|:--------:|
| 56 | great | a.jpg |  1234   |  10123   |

###miglate_file
create_table:messeges do |t|  
t.integer :message_id  
t.text    :body  
t.text    :image  
t.reference:user_id  
t.reference :group_id  

###Relations_Table
| User_id | Group_id|
|:-------:|:-------:|
| 12      | 10123   |

###Migration_file
create_table:relations do |t|  
t.reference :user_id  
t.reference :group_id  


###Groups_Table
| id | Group_name |
|:--:|:----------:|
| 10 |  group1    |

###migrate_file
create_table:groups do |t|  
t.integer :group_id  
t.string  :group_name,null : false  

##Asociation
user has many relations  
user has many messages  
user has many groups, through: :relations  
  
group has many relations
group has many users, through: :relations  
group has many messages  
  
message belongs to user  
messege belongs to group  
  
relation belongs to group  
relation belongs to user  

