require 'rails_helper'

RSpec.describe "ApiDevelopments", type: :request do
	def parsed_body
		JSON.parse(response.body)
		
	end



	describe "RBDMS-backed" do

		before(:each) {foo.delete_all}
		after(:each)  {foo.delete_all}


		it "create RBDMS-backed model" do
			object=Foo.create(:name=>"test")
			expect(Foo.find(object.id).name).to eq("test")
		end

		it "expose RBDMS-backed API resource" do
			object=Foo.create(:name=>"test")
			expect(foos_path).to eq("/api/foos")
			get foo_path(object.id)
			expect(response).to have_http_status(:ok)
			expect(parsed_body["name"]).to eq("test")

		end
	end

	describe "MongoDB-backed" do
		before(:each) {Bar.delete_all}
		after(:each)  {Bar.delete_all}
		
		it "create MongoDB-backed model" do
			object=Bar.create(:name=>"test")
			expect(Bar.find(object.id).name).to eq("test")
		end

		it "expose MongoDB-backed API resource" do
			object=Bar.create(:name=>"test")
			expect(bars_path).to eq("/api/bars")
			get bar_path(object.id)
			expect(response).to have_http_status(:ok)
			expect(parsed_body["name"]).to eq("test")
			expect(parsed_body).to include("created_at")
			byebug
			expect(parsed_body).to include("id"=>object.id.to_s)

		end
	end



  # describe "GET /api_developments" do
  #   it "works! (now write some real specs)" do
  #     get api_developments_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
