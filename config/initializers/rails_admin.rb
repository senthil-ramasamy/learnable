RailsAdmin.config do |config|

  config.main_app_name = ["Learnable", "Name"]
  # or somethig more dynamic
  config.main_app_name = Proc.new { |controller| [ "Learnable", "Name - #{controller.params[:action].try(:titleize)}" ] }

  ### Popular gems integration

  ## == Devise ==
  config.authorize_with do |controller|
    redirect_to main_app.root_path unless current_user.try(:admin?)
  end
  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
