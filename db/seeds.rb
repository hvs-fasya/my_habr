# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create([{title: 'Very First Post', body: 'This the first attempt to publish smth...'},{title: 'The Second', body: 'One more attempt... may be also not the best...'}])
Category.create([{title: 'About Kittens'},{title: 'About Puppies'},{title: 'About Small Funny Rabbits'},{title: 'About Huge Crocodiles'}])
Tag.create([{name: 'small&funny'},{name: 'wild nature'},{name: 'pets'}])
PostsTag.create([{post_id: '1', tag_id: '2'},{post_id: '1', tag_id: '3'}])
CategoriesPost.create([{category_id: '2', post_id: '1'},{category_id: '1', post_id: '2'}])
User.create([{email: 'hvs-fasya@mail.ru', password: '12345678', password_confirmation: '12345678'},{email: 'amr05-05@mail.ru', password: '12345678', password_confirmation: '12345678'}])
Profile.create([{firstname: 'Elena', lastname: 'Tolkacheva', email: 'hvs-fasya@mail.ru', user_id: '1'}])
Post.find(1).update(user_id: '2')
Post.find(2).update(user_id: '2')
Post.create([{title: 'Фирма, торгующая медоборудованием.', body: '
Р. –Ленк, тут у меня запрос пришел. Зайдешь, посмотришь, кому это нести? Может это ваше…<br>
Л. –А че там хотят?<br>
Р. –Ну ты зайди, посмотри. Что тебе, трудно что ли…<br>
Л. –Слушай, прекращай делать из меня дуру и читай. Некому кроме нас эту дрянь сбагрить что ли?<br>
Р. –Ольга в отпуске…. уже неделю как…<br>
Л. –Поняааатно….  а я сижу удивляюсь, что у публики последнюю неделю осеннее обострение – такое запрашивают, что хочется снести денег в фонд поддержания психического здоровья нации….<br>
Р. –А мне каково с этим ее отпуском??? звонят то они мне!!!<br>
Л. –Ладно, не ной, читай чего там у тебя…<br>
Р. -…..ээээ…. ну, в общем… ну тут….<br>
Л. –НУУУУ!!!!<br>
Р. –Трупоперевозка на 8 персон!!!!!<br>
Л. –На 8 кого?????<br>
Р. –Это не я, тут так написано…. честно…<br>
Л. –Стесняюсь спросить, а каким боком ты хочешь ЭТО на наш отдел повесить???? У нас, между прочим, реанимация и интенсивная терапия. Че то я не слыхала, чтобы реанимировали этих, как ты выражаешься, персон.<br>
Р. –(мрачно) вот-вот, стоматологи тоже отказываются… почему-то….<br>
Л. –Ну, погоди, ну у нас же 17 отделов, ну должно же это хоть к кому-нибудь относиться.<br>
Р. –(тоскливо) к комууу…<br>
Л. –Так. У тебя под носом список отделов, давай по названиям.<br>
Р. –Да, я уже выучила наизусть даже  то, что на обратной стороне этого списка написано.<br>
Л. – Хи-хи. И чего там написано?<br>
Р. –Чего-чего… все, что предыдущая секретарша о нашем начальстве думала… длинно и иногда даже художественно…<br>
Л. –Хорошо, давай по-другому. Ольга, понятно, в отпуске, но в ее отделе должен же оставаться кто-нибудь на хозяйстве. Просто надо у них спросить. (победно) Вот и все!!!!<br>
Р. –Ага (ехидно), это в ваших буржуинских отделах должен. А у нее не должен. Она одна и есть весь отдел.<br>
Л. –Хмм, и чего у нее за отдел?<br>
Р. –Предложения на тендеры она готовит. Десятками.<br>
Л. –Так на кой, вообще, такой дурацкий отдел нужен. Фигней занимается, ей-богу.<br>
Р. –Хи-хи. Фигней не фигней, а выручки она напредлагала за тот год столько же сколько все остальные 16 отделов. Деньгами.<br>
Л. –Слушай, а как она это делает?<br>
Р. –Как, как… она ж напротив тебя через аквариум сидит… сидит хлопает с утра до ночи глазищами, в компьютер таращится, а я только картриджи бегаю заправлять, потому что она у нас распечатывается…<br>
Л. –М-даа… вот такой вот незаметный герой нашего времени…. чегой-то взгрустнулось мне как-то, на лирику потянуло….. внезапно…<br>
Р. -Взгрустнулось ей!!!! С запросом то чего делать будем????<br>
Л. –С запросом? Ах да, с запросом. Пиши – диктую:<br>

«Ваш запрос на оборудование от … числа в связи с особой значимостью Вашего проекта, а также с учетом особого статуса Вашей компании как нашего многолетнего партнера, направлен на отдельное рассмотрение нашего Тендерного комитета в составе представителя высшего руководства нашей фирмы, начальника вышеуказанного комитета и технического персонала»<br> 

ну, дальше сама знаешь – там всякие «с уважением, желаем, поздравляем, любим, целуем». Отправляй, а там Ольга вернется из отпуска и все разрулит  в лучшем виде.<br>
И, это… сегодня ж пятница… пиво пить идем? под лирическое то настроение? 
	'}])
Post.find(3).update(user_id: '1')
Comment.create([{body: 'Ffffuuuhhh...', post_id: '3'},{body: 'Oh! no! that is also ffuuuuhhh...', post_id: '2' }])
PostsTag.create([{post_id: '3', tag_id: '2'},{post_id: '3', tag_id: '3'}])
CategoriesPost.create([{category_id: '2', post_id: '3'},{category_id: '1', post_id: '3'}])
Comment.find(1).update(user_id: '2')
Comment.find(2).update(user_id: '1')
User.create([{email: 'admin@mail.ru', password: '12345678', password_confirmation: '12345678', admin: true}])
Post.create([{title: 'The Fourth...', body: 'One more attempt...', published: true, user_id: '1'},{title: 'The Fifth Post!', body: 'Attempts again and again...', published: true, user_id: '1'}])
Subscription.create([{post_subscriber_id: '1', subscribed_post_id: '3'},{post_subscriber_id: '1', subscribed_post_id: '2'},{post_subscriber_id: '2', subscribed_post_id: '3'}])