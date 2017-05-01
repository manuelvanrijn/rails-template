RSpec.describe ApplicationHelper, type: :helper do
  describe '#paginate' do
    it 'overrides the paginate to include the bootstrap theme' do
      obj = double('obj')
      expected_options = {
        theme: 'twitter-bootstrap-3',
        pagination_class: 'pagination-sm no-margin'
      }

      expect_any_instance_of(Kaminari::ActionViewExtension)
        .to receive(:paginate).with(obj, expected_options)

      helper.paginate(obj, {})
    end
  end
end
