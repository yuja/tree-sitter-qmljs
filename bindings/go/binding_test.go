package tree_sitter_qmljs_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-qmljs"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_qmljs.Language())
	if language == nil {
		t.Errorf("Error loading Qmljs grammar")
	}
}
