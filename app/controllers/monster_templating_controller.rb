class MonsterTemplatingController < AbstractController::Base
  include AbstractController::Logger
  include AbstractController::Rendering
  if defined?(AbstractController::Layouts)
    include AbstractController::Layouts
  else
    include ActionView::Layouts
  end
  include AbstractController::Helpers
  include AbstractController::Translation
  include AbstractController::AssetPaths
  include Rails.application.routes.url_helpers

  self.view_paths = 'app/templates'
  self.assets_dir = 'app/public'

  helper ApplicationHelper

  public
    def r partial, options = {}
      I18n.with_locale options[:locale] || :en do
        render template: partial
      end
    end

    def self.files
      Dir[Rails.root.join('app','templates','*','**','**')]
    end

    def self.render_templates
      controller = MonsterTemplatingController.new
      result = {}
      prefix = Rails.root.join('app','templates').to_s
      files = Dir[Rails.root.join('app','templates','*','**','**')]
      files.reject!{|f| File.basename(f)[0] == '_'}
      files.each do |file|
        if m = file.match(/#{prefix}\/(.+).haml/)
          template_name = m[1]
          puts template_name.inspect
          result[template_name] = controller.r(template_name)
        end
      end
      result
    end
end
