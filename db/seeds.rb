# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#name description price
#Product.create(:title => 'Urban Warfare', :description => 'designed by Will St Leger, White fitted t-shirt, 100% cotton', :unit_price => '15.50')
#Product.create(:title => 'Greed is te Knife', :description => 'designed by Maser, White fitted t-shirt, 100% cotton', :unit_price => '15.50')
#Product.create(:title => 'Pricks and Mortar', :description => 'designed by ADW, White fitted t-shirt, 100% cotton', :unit_price => '15.50')
#Product.create(:title => 'ApexTwin', :description => 'designed by Loki, White fitted t-shirt, 100% cotton', :unit_price => '15.50')
#Product.create(:title => 'I love Lamp', :description => 'I love lamp, White fitted t-shirt, 100% cotton', :unit_price => '15.50')

Product.delete_all
Product.create(:title => 'Urban Warfare',
  :description =>
    %{<p>
        <em>Urban Warfare</em> 100% Organic cotton T-Shirt designed by Will StLeger
      </p>},
  :image_url =>   '/images/tShirtA.jpg ',
  :unit_price => 15.00)
# . . .
Product.create(:title => 'Greed is the Knife',
  :description =>
    %{<p>
        <em>Greed is the Knife</em>100% Organic cotton T-Shirt designed by Maser
      </p>},
  :image_url => '/images/tShirtB.jpg',
  :unit_price => 15.00)
# . . .
Product.create(:title => 'Pricks and Mortar',
  :description =>
    %{<p>
        <em>Pricks and Mortar</em> 100% Organic cotton T-Shirt designed by ADW
      </p>},
  :image_url => '/images/tShirtC.jpg ',
  :unit_price => 15.00)
# . . .
Product.create(:title => 'ApexTwin',
  :description =>
    %{<p>
        <em>ApexTwin</em>100% Organic cotton T-Shirt designed by Loki
      </p>},
  :image_url => '/images/tShirtD.jpg',
  :unit_price => 15.00)
# . . .

Product.create(:title => 'I love Lamp',
  :description =>
    %{<p>
        <em>I love Lamp</em>100% Organic cotton T-Shirt designed by I Love Lamp
      </p>},
  :image_url => '/images/tShirtE.jpg',
  :unit_price => 15.00)
