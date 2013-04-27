# images = new Array('easter_egg/lsp_gif.gif','easter_egg/lsp_gif_2.gif','easter_egg/lsp_gif_3.gif','easter_egg/lsp_gif_4.gif')
# images = [ ]
# index = 0

# images[0] = '/lsp_gif.gif'
# images[1] = '/lsp_gif_2.gif'
# images[2] = '/lsp_gif_3.gif'
# images[3] = '/lsp_gif_4.gif'

# l = images.length

# random_no = Math.floor(l*Math.random())
# document.getElementById("image_load").src = images[random_no]

# index = Math.floor(Math.random() * images.length)
# document.write =image_tag(images[index])

images = ['easter_egg/lsp_gif.gif','easter_egg/lsp_gif_2.gif','easter_egg/lsp_gif_3.gif','easter_egg/lsp_gif_4.gif']

$('<img src="assets/' + images[Math.floor(Math.random() * images.length)] + '">').appendTo('#imageContainer');
