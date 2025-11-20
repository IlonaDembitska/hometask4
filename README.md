# DevOps — Hometask #4  
Тема: Користувачі, sudo, права доступу  
Дата: 12/10/2025  
Дембіцька Ілона

---

##  Завдання
- Створити AWS EC2 instance (Ubuntu 22.04, AMI: ami-053b0d53c279acc90)  
- Створити користувачів adminuser і poweruser  
- Задати пароль для adminuser  
- Надати adminuser права sudo  
- Дозволити poweruser вхід без пароля  
- Додати poweruser дозвіл виконувати команду iptables  
- Дозволити тільки poweruser читати домашню директорію adminuser  
- Створити softlink на /etc/mtab у домашній директорії poweruser  

---

## Основні команди
sudo adduser adminuser
sudo passwd adminuser
sudo usermod -aG sudo adminuser

sudo adduser poweruser
sudo passwd -d poweruser
sudo visudo      # дозволити poweruser виконувати iptables без пароля
ln -s /etc/mtab /home/poweruser/mtab_link

---

##  Перевірка
su - adminuser
sudo whoami       # має вивести root
su - poweruser
ls -l /home/adminuser
ls -l /home/poweruser

 poweruser має бачити softlink,  
 adminuser має sudo-доступ,  
 логін без пароля для poweruser працює.
