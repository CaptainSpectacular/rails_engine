require 'rails_helper'

describe 'Item API' do
  it 'sends a list of items' do
    create_list(:item, 3)

    get '/api/v1/items'
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end
  it 'can send a single item' do
    item = create(:item)
    id = item.id

    get "/api/v1/items/#{id}"

    searched_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_item["id"]).to eq(id)
  end
  it 'can find by an id' do
    item = create(:item)
    id = item.id

    get "/api/v1/items/find?id=#{id}"

    searched_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_item["id"]).to eq(id)
  end
  it 'can find by a name' do
    item = create(:item)
    name = item.name

    get "/api/v1/items/find?name=#{name}"

    searched_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_item["name"]).to eq(name)
  end
  it 'can find by description' do
    item = create(:item)
    description = item.description

    get "/api/v1/items/find?description=#{description}"

    searched_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_item["description"]).to eq(description)
  end
  it 'can find all by name' do
    list = create_list(:item, 3)
    name = list[0][:name]

    get "/api/v1/items/find_all?name=#{name}"

    searched_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_items.count).to eq(3)
    expect(searched_items[0]["name"]).to eq(name)
  end
  it 'can find all by description' do
    list = create_list(:item, 3)
    description = list[0][:description]

    get "/api/v1/items/find_all?description=#{description}"

    searched_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_items.count).to eq(3)
    expect(searched_items[0]["description"]).to eq(description)
  end
  it 'can find an item by random' do
    list = create_list(:item, 3)

    get "/api/v1/items/random"

    searched_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(searched_item.count).to eq(5)
  end
  describe 'class methods' do
    xit 'can find the most revenue' do
      item_1 = create(:item)
      item_2 = create(:item_2)

      expect(Item.most_revenue(1)).to eq(item_2)
      expect(Item.most_revenue(2)).to eq([item_2, item])
    end
  end
end
