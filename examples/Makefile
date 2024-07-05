GIT = git
GIT_LOG_FLAGS = -p --reverse
QTDECLARATIVE_GIT_ID = f5f0c7c8fa69c87725e0f840b3bc1446821c7412

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
