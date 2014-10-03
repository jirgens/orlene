User.create(:id => 1, :email => 'orlene.sandefer', :password => 'weddings/events!')

User.create(:id => 2, :email => 'jessa.irg@gmail.com', :password => 'brooklyn')

welcome = Post.create(:id => 1, :title => 'Welcome to Laughing With Flowers!', :body => 'This is my fist post on laughingwithflowers.com. Please check back often to see what I am up to!')
welcome.created_at =  (rand*10).days.ago
welcome.save

second = Post.create(:id => 2, :title => 'Just testing to see if Post works!', :body => 'Edit me!. Please check back often to see what I am up to!')
second.created_at =  (rand*2).days.ago
second.save

Album.create(:id => 1, :title => 'Weddings')
Album.create(:id => 2, :title => 'Terrariums')
Album.create(:id => 3, :title => 'Events')
