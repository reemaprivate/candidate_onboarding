# frozen_string_literal: true

module FormHelper
  def input_classes
    'mt-1 block w-full rounded-lg border border-gray-300 px-3 py-2 ' \
      'focus:border-blue-500 focus:ring-2 focus:ring-blue-500 ' \
      'focus:outline-none'
  end

  def label_classes
    'block text-sm font-medium text-gray-700'
  end

  def primary_button_classes
    'w-full rounded-lg bg-blue-600 px-4 py-2 font-medium text-white ' \
      'hover:bg-blue-700 transition'
  end
end
