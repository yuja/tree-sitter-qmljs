GIT = git
GIT_LOG_FLAGS = -p --reverse
QTDECLARATIVE_GIT_ID = 0033e3f7f1f6e413e107f9060f236f3696b1d3f5

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
