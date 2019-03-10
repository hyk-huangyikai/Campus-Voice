配置环境  MySQL + eclipse + Tomcat

1. 配置好数据库的环境，在project项目/WebContent/sql/下有
创建表的sql文件createTable.sql，也有测试用的插入数据的sql文件
insert_data.sql，先运行createTable.sql，再运行insert_data.sql。

2. 需要配置好eclipse和Tomcat连接环境。

3. 在eclipse下new->dynamic web project创建项目s（如果没有需要
安装插件，在New/install New Software安装），然后将我们提供的源码
项目文件的WebContent文件夹覆盖到新建的项目s下对应的WebContent文件夹。

4. 在eclipse中打开WebContent/jsp/controller的dbconnect.jsp，将连接数据库
名字改为自己本地的用户名和密码。

5. 使用homepage.jsp运行WebContent/jsp/homepage.jsp文件，即可启动校园知声网站。

注意：若出现不能运行，则可能本地eclipse和Tomcat相关环境还没配置好，有可能缺少连接
数据库的jar包和上传文件的jar包，配置好环境则可以正常执行，谢谢阅读。