# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

content = <<-LOREM
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a diam velit, vitae euismod sapien. Integer a rhoncus nunc. Vestibulum ut est nunc. In non laoreet nisl. Nullam ornare molestie eros facilisis consectetur. Nunc vel ligula est, et hendrerit arcu. Quisque nunc lorem, sollicitudin ac rhoncus eget, malesuada et lorem. Nulla ornare enim nec purus placerat et ultrices erat commodo. Nunc sagittis arcu non est pharetra posuere et nec nibh. Pellentesque condimentum tincidunt neque eget rutrum. Donec lobortis, enim et euismod tristique, nisi ante placerat lorem, eget tempus nisi nunc sit amet lorem. Nulla aliquet, arcu eu pulvinar facilisis, quam orci ultrices enim, ut imperdiet leo urna et arcu. Fusce massa felis, varius convallis consequat eu, faucibus ac tellus. Vivamus nec dui ac dui dignissim pellentesque eu ac ligula. Aenean eget cursus eros.

  Integer odio dui, congue sed blandit ac, commodo id nulla. Etiam sed lobortis elit. Sed vel tortor non justo ullamcorper cursus. Quisque eget lectus sit amet eros porttitor lacinia sit amet non nunc. Nam a quam at arcu fermentum commodo non sit amet purus. Donec vel enim nunc. Donec vitae scelerisque felis. Morbi rutrum risus et justo ornare scelerisque. In fermentum lacus quis urna cursus egestas. Nullam dolor diam, lacinia blandit imperdiet eget, ultrices eget felis. Aenean convallis lacinia leo id interdum. Duis scelerisque odio a metus condimentum sit amet venenatis diam placerat. Fusce ut quam enim.

  Etiam tellus enim, volutpat ut euismod viverra, pulvinar ac orci. Maecenas a turpis mi. Sed sodales est ac erat vestibulum sagittis. Nullam pharetra neque dapibus felis sodales consectetur scelerisque massa rhoncus. Etiam pharetra lectus sed nibh pellentesque in iaculis augue venenatis. Nam sollicitudin, lorem eget lacinia eleifend, augue metus auctor erat, a pharetra risus mauris sit amet augue. Maecenas euismod orci et urna scelerisque aliquam. Cras est quam, tempus vitae hendrerit facilisis, mattis at ipsum. Aenean ac elementum lorem. Integer ut tortor felis.
LOREM

(1..5).each do |post_number|
  Post.create(:title => "Post #{post_number}", :body => content)
end