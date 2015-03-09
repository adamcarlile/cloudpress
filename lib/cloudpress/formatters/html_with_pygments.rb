module Formatters
  class HTMLWithPygments < Metadown::Renderer
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language)
    end
  end
end