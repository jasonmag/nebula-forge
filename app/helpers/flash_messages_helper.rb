module FlashMessagesHelper
  def render_flash_message
    return unless @flash[:message]

    css_classes = {
      success: 'bg-green-100 border-green-400 text-green-700',
      error: 'bg-red-100 border-red-400 text-red-700'
    }

    content_tag :div,id: "flashMessage", class: "flash-message px-4 py-2 rounded-full shadow-md #{css_classes[@flash[:type].to_sym]}" do
      concat content_tag(:strong, @flash[:type].capitalize + '!')
      concat content_tag(:span, @flash[:message], class: 'block sm:inline ml-2')
      concat close_button
    end
  end

  def close_button
    content_tag :span, class: 'absolute top-0 right-0 px-4 py-2 cursor-pointer', onclick: 'this.parentElement.remove()' do
      content_tag :svg, class: 'fill-current h-6 w-6 text-red-500', role: 'button', xmlns: 'http://www.w3.org/2000/svg', viewBox: '0 0 20 20' do
        concat content_tag(:title, 'Close')
        concat tag(:path, d: 'M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z')
      end
    end
  end
end
