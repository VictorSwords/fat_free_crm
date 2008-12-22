module LeadsHelper

  # We need this because standard Rails [select] turns &#9733; into &amp;#9733;
  #----------------------------------------------------------------------------
  def rating_select(name, options = {})
    stars = (1..5).inject({}) { |hash, star| hash[star] = "&#9733;" * star; hash }.sort
    options_for_select = %(<option value="">-- None --</option>)
    options_for_select << stars.inject([]) {|array, star| array << %(<option value="#{star.first}">#{star.last}</option>); array }.join
    select_tag name, options_for_select, options
  end

  #----------------------------------------------------------------------------
  def subtitle(id, text)
    link_to_remote "<small id='#{id}_arrow'>&#9658;</small> #{text}", :url => url_for(:action => :toggle, :id => id), :with => "'visible=' + Element.visible('#{id}')"
  end

end