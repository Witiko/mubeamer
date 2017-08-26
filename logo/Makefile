SHELL=/bin/bash
SCRAPER_DIR=../sablony-muni-scraper/logo

WORKPLACES=arch ceitec cerit ctt czs econ fi fsps fss iba ics is kariera lang \
	law med mu muzeu ped phil press ptceitec rect sci skm teiresias ucb uct
PREFIX=mubeamer
LANGUAGES=english czech
EXTENSIONS=pdf eps
FILES=$(foreach WORKPLACE, $(WORKPLACES), $(foreach LANGUAGE, $(LANGUAGES), $(foreach EXTENSION, $(EXTENSIONS), $(addprefix $(PREFIX)-$(WORKPLACE)-$(LANGUAGE), .$(EXTENSION) -color.$(EXTENSION)))))

find_candidate=\
	@FILENAME=$(2); \
	WORKPLACE=`sed -r 's/$(PREFIX)-([^-]*).*/\1/' <<<$$FILENAME`; \
	for CANDIDATE in $(SCRAPER_DIR)/$(1); do \
		if [[ -e $$CANDIDATE ]]; then \
			cp -v $$CANDIDATE $@ && exit 0; \
		fi; \
	done;


ENGLISH_GLOB=$${WORKPLACE}_{pecet,logo,znak}{,-s-dovetkem}-{cb,modra,cmyk,rgb}{-modra,}{_en,}.pdf
CZECH_GLOB=$${WORKPLACE}_{pecet,logo,znak}{,-s-dovetkem}-{cb,modra,cmyk,rgb}{-modra,}{_cz,}.pdf
ENGLISH_COLOR_GLOB=$${WORKPLACE}_{pecet,logo,znak}{,-s-dovetkem}-{rgb,cmyk,modra,cb}{-modra,}{_en,}.pdf
CZECH_COLOR_GLOB=$${WORKPLACE}_{pecet,logo,znak}{,-s-dovetkem}-{rgb,cmyk,modra,cb}{-modra,}{_cz,}.pdf

.PHONY: all clean
all: $(FILES)
%-english.pdf:
	$(call find_candidate,$(ENGLISH_GLOB),$@)

%-czech.pdf:
	$(call find_candidate,$(CZECH_GLOB),$@)
	@if [[ -e $@ ]] && [[ `md5sum <$@` = `md5sum <$$(sed 's/-czech\.pdf$$/-english.pdf/' <<<$@)` ]]; then \
		rm -v $@; \
	fi


%-english-color.pdf:
	$(call find_candidate,$(ENGLISH_COLOR_GLOB),$@)

%-czech-color.pdf:
	$(call find_candidate,$(CZECH_COLOR_GLOB),$@)
	@if [[ -e $@ ]] && [[ `md5sum <$@` = `md5sum <$$(sed 's/-czech-color\.pdf$$/-english-color.pdf/' <<<$@)` ]]; then \
		rm -v $@; \
	fi

$(PREFIX)-ptceitec-english.pdf: $(PREFIX)-ceitec-english.pdf
	cp -v $< $@

$(PREFIX)-ptceitec-english-color.pdf: $(PREFIX)-ceitec-english-color.pdf
	cp -v $< $@

%.eps: %.pdf
	@if [[ -e $< ]]; then \
		inkscape --export-eps=$@ $<; \
	fi

clean:
	rm -f $(FILES)
