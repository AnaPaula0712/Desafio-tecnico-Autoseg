# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#Adm user with example tasks
path_adm = Rails.root.join 'app', 'assets', 'images', 'test-update.png'
adm = User.create(email: 'adm@email.com', password: '123123')
Profile.create(nickname: 'Mukuro', bio: 'Just your administration User', user: adm, share: true).avatar.attach(io: File.open(path_adm), filename: "test-image.png")
for i in 0..2 do
  task = Task.create(title: "Example Task \##{i + 1}", description: 'A Task can have a description of up to 280 characters!', priority: (10*i), user: adm, status: 10, share: true)
  Comment.create(body: "This Example Task \##{i + 1} has one Example Comment!", task: task, user: adm)
end
# Normal user 1
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user = User.create(email: 'a@b.c', password: '123123')
Profile.create(nickname: 'Junko', bio: 'Just your normal User number 1', user: user).avatar.attach(io: File.open(path_user), filename: "test-image.png")
task = Task.create(title: 'Organize Class Trial', description: 'Help organize my classmates for a class debate', priority: 20, user: user, share: true)
comment = Comment.create(body: "I'll help you out", task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 2)

# Normal user 2
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user = User.create(email: '1@2.3', password: '123123')
Profile.create(nickname: 'Nagito', bio: 'Just your normal User number 2', user: user).avatar.attach(io: File.open(path_user), filename: "test-image.png")
Task.create(title: 'Escape room', description: 'I want to try the new Escape Room in town', priority: 10, user: user, share: true)

# Tarefa 2
# Itens 2.1 - Popular banco de dados

# Normal user 3
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user = User.create(email: 'maria@email.com', password: '123456')
Profile.create(nickname: 'Maria', bio: 'Just your normal User number 3', user: user).avatar.attach(io: File.open(path_user), filename: "test-image.png")
Task.create(title: 'Brincar com os gatos', description: 'Passar mais tempo curtindo meus dois gatos', priority: 10, user: user, share: true)
Comment.create(body: 'Arranhadores podem ser bons brinquedos', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
Comment.create(body: 'Ofereça petiscos depois das brincadeiras', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
Comment.create(body: 'Corra com os gatos dentro de casa', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 4)
Task.create(title: 'Cozinhar', description: 'Preparar o jantar para a semana', priority: 10, user: user, share: true)
Comment.create(body: 'Seria bom organizar o cardápio', task: task, user: adm)
Comment.create(body: 'Organize a lista do supermercado de acordo com o cardápio', task: task, user: adm)
Comment.create(body: 'Dividir o preparo das refeições com outra pessoa é importante', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 5)
Task.create(title: 'Arrumar o armário', description: 'Organizar todas as roupas no armário', priority: 10, user: user, share: true)
Comment.create(body: 'Você pode separar itens para doação', task: task, user: adm)
Comment.create(body: 'Conheço um local que recebe doações', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 3)

# Normal user 4
path_user = Rails.root.join 'app', 'assets', 'images', 'test-image.png'
user = User.create(email: 'jose@email.com', password: '123456')
Profile.create(nickname: 'José', bio: 'Just your normal User number 4', user: user).avatar.attach(io: File.open(path_user), filename: "test-image.png")
Task.create(title: 'Organizar cartas', description: 'Organizar minhas cartas de Magic', priority: 10, user: user, share: true)
Comment.create(body: 'Você pode colocar sleeves em todas elas', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 4)
Task.create(title: 'Ler livros', description: 'Terminar de ler o livro escolhido da semana', priority: 10, user: user, share: true)
Comment.create(body: 'Posso te recomendar uma nova dica de leitura', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 5)
Task.create(title: 'Arrumar o armário', description: 'Organizar todas as roupas no armário', priority: 10, user: user, share: true)
Comment.create(body: 'Separe itens para doação', task: task, user: adm)
Comment.create(body: 'Coloque as roupas de inverno para pegar um ar', task: task, user: adm)
Pluse.create(comment: comment, user: adm)
Pluse.create(comment: comment, user: user)
comment.update(score: 3)
