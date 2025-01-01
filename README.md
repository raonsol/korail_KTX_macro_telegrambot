# 코레일 KTX 예매 텔레그램 챗봇

> 아... 지금 보니까 전부 다 리펙토링 하고 싶은데 귀찮다....

## 참고

- 본 서비스는 [carpedm20/korail2](https://github.com/carpedm20/korail2)를 기반으로 합니다.
- 업데이트 되지 않은 일부 수정사항이 있어서 본 repo로 직접 copy해와서 사용하고 있습니다.

## 주의사항

1. 귀경길 기차 예매를 하지 못한 안타까운 영혼들을 위해 만든 프로그램이므로, 개인용 목적이 아닌 상업적 목적등으로 이용하는 것을 엄중히 금합니다.
2. 본 프로그램을 사용할 경우, 기본으로 설정된 1초에 1번 조회 요청에 대한 설정 값 이상으로 빠르게 설정하지 마십시오. 코레일 서버에 무리가 갈 뿐 아니라, 단위 시간내에 보다 빠른 값으로 조회를 요청할 경우, 계정이 정지될 수 있습니다.
3. 본 프로그램은 2021-02-07일 기준으로 정상 동작하지만, 사이트의 구성이나 변수명 변경등에 따라 언제든 동작하지 않을 수 있습니다.

## 설정법

- [pipenv](https://pipenv.pypa.io/en/latest/) 사용 프로젝트
- Makefile 참조

```bash
pipenv install
pipenv run python app.py
```

- 필수 환경변수
`.env.example` 파일을 참조하여 아래와 같이 `.env` 파일을 생성합니다.

```bash
USERID # 코레일 아이디
USERPW # 코레일 비밀번호
BOTTOKEN # 텔레그램 봇 토큰
```

### 텔레그램 설정

1. 텔레그램 봇을 생성하고 API 토큰을 발급받은 후, `.env` 파일에 `BOTTOKEN` 환경변수로 설정합니다.
2. 다음 API를 통해 webhook을 설정합니다. 서버 endpoint는 https로 설정되어야 하며, 80, 88, 443, 8443 포트만 허용됩니다.
```bash
curl -F "url=[서버 endpoint]" "https://api.telegram.org/bot[BOTTOKEN 키]/setWebhook"
```

## 실행

### 로컬 설치 및 실행(macOS)

실행 후의 endpoint는 `localhost:8080/telebot`입니다.

```bash
make mac-setup
```

### Docker 컨테이너 빌드 및 실행

```bash
make build
make run-docker
```

## 관리자편의 로그인 기능 사용하고 싶은 경우

```bash
docker run -dit -e USERID=[본인코레인ID] -e USERPW=[본인코레일PW] -p [외부에 노출시킬 포트]:8080 [빌드한 이미지명]
```
