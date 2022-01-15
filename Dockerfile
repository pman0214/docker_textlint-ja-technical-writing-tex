# Copyright (c) 2021 Shigemi ISHIDA
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM node:17-slim

RUN set -x && \
	echo '### install lintian' && \
	npm install -g \
		textlint \
		textlint-plugin-latex2e \
		textlint-rule-no-dead-link \
		textlint-rule-date-weekday-mismatch \
		textlint-rule-no-nfd \
		textlint-rule-proofdict \
		textlint-rule-ja-hiragana-keishikimeishi \
		textlint-rule-ja-hiragana-fukushi \
		textlint-rule-ja-hiragana-hojodoushi \
		textlint-rule-preset-ja-engineering-paper \
		textlint-rule-preset-ja-spacing \
		textlint-rule-preset-ja-technical-writing \
		textlint-rule-preset-jtf-style \
		textlint-rule-preset-japanese

#--------------------------------------------------
WORKDIR /app
CMD ["sh"]
