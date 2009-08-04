# encoding: UTF-8

module Decider
  module Clustering
    class NearestNodes < Base
      
      def tree
        unless @tree
          @tree = BkTree.new
          corpus.documents.each do |doc|
            @tree.insert(doc.name, vector(doc))
          end
        end
        @tree
      end
      
      def invalidate_cache
        @tree = nil
        super
      end
      
      def in_range(range, document)
        doc = new_document(:query_doc, document)
        tree.nearest_neighbors(range, vector(doc))
      end
      
    end
  end
end
