GIT = git
GIT_LOG_FLAGS = -p --reverse
QTDECLARATIVE_GIT_ID = 21d5d5b7d7f45cf3123c6418a3d9381887c6c109

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
