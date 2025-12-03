DOXY_EXEC_PATH = C:/Users/Admin/Downloads/securepasswault-main/securepasswault-main
DOXYFILE = C:/Users/Admin/Downloads/securepasswault-main/securepasswault-main/-
DOXYDOCS_PM = C:/Users/Admin/Downloads/securepasswault-main/securepasswault-main/perlmod/DoxyDocs.pm
DOXYSTRUCTURE_PM = C:/Users/Admin/Downloads/securepasswault-main/securepasswault-main/perlmod/DoxyStructure.pm
DOXYRULES = C:/Users/Admin/Downloads/securepasswault-main/securepasswault-main/perlmod/doxyrules.make

.PHONY: clean-perlmod
clean-perlmod::
	rm -f $(DOXYSTRUCTURE_PM) \
	$(DOXYDOCS_PM)

$(DOXYRULES) \
$(DOXYMAKEFILE) \
$(DOXYSTRUCTURE_PM) \
$(DOXYDOCS_PM): \
	$(DOXYFILE)
	cd $(DOXY_EXEC_PATH) ; doxygen "$<"
