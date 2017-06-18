module CataloguesHelper
  def setup_catalogue(catalogue)
    # ... code from above omitted

    
    catalogue.exhibitions ||= catalogue.exhibitions.build
    # catalogue.histories ||= History.new
    # 1.times {
    #     catalogue.exhibitions.build;
    #     catalogue.exhibitions.first.spaces.build;
    # }
    catalogue
  end
end
