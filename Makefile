#!make
include .env
export

ORG=Peony-Inc
NAME=PeonyRunner
GROUP=PeonyCI
QTY=10
RUNNERS_DIR=./runners
RUNNERS=$(notdir $(patsubst %/,%,$(dir $(wildcard ${RUNNERS_DIR}/${NAME}*/))))
RUNNERS_COUNT=$(shell ls -l ${RUNNERS_DIR} | grep ^d | wc -l)

.PHONY: runners

runners:
	@(mkdir -p ${RUNNERS_DIR})
	@for i in $(shell seq 1 $(QTY)) ; do make create-org name=$(NAME)$$(( $$RUNNERS_COUNT + $$i )) labels=${labels} ; done

create:
	@(cd ${RUNNERS_DIR} && sh ../scripts/create-latest-svc.sh -s ${ORG} -n ${name} -l ${labels})

create-org:
	@(cd ${RUNNERS_DIR} && sh ../scripts/create-latest-svc.sh -s ${ORG} -n ${name} -r ${GROUP} -l ${labels})

remove: 
	@(cd ${RUNNERS_DIR} && for runner in ${RUNNERS} ; do sh ../scripts/remove-svc.sh ${ORG} $(notdir $$runner) ; done)

delete:
	@(cd ${RUNNERS_DIR} && for runner in ${RUNNERS} ; do sh ../scripts/delete.sh ${ORG} $(notdir $$runner) ; done)

clean:
	$(info Cleaning runners...)
	rm -rf ./runners