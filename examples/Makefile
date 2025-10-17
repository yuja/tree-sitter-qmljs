GIT = git
GIT_LOG_FLAGS = -p --reverse
QTDECLARATIVE_GIT_ID = ad65c8d89fd67cc11f04d8d3019149e98466c9fc

.PHONY: all
all: qtdeclarative

.PHONY: qtdeclarative
qtdeclarative:
	[ -d $@ ] || $(GIT) clone git://code.qt.io/qt/qtdeclarative.git $@
	$(GIT) -C $@ fetch
	$(GIT) -C $@ reset --hard $(QTDECLARATIVE_GIT_ID)

.PHONY: review-qtdeclarative
review-qtdeclarative:
	$(GIT) -C qtdeclarative log $(GIT_LOG_FLAGS) \
		$(QTDECLARATIVE_GIT_ID)..origin/dev \
		src/qml/compiler/qqmlirbuilder.cpp \
		src/qml/parser
