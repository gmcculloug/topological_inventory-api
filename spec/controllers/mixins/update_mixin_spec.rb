describe Api::Mixins::UpdateMixin do
  describe Api::V0x0::SourcesController, :type => :request do
    let(:tenant) { Tenant.create! }

    it "patch /sources/:id updates a Source" do
      source = Source.create!(:tenant => tenant, :name => "abc")

      patch(api_v0x0_source_url(source.id), :params => {:name => "xyz"})

      expect(source.reload.name).to eq("xyz")

      expect(response.status).to eq(204)
      expect(response.parsed_body).to be_empty
    end
  end
end