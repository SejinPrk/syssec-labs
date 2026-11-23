# 실습 환경 (Apple Silicon Mac)

교수님 lecture 4 Docker 컨테이너(32비트 x86 Linux)에 내 레포를 연결해서 씀.
코드는 맥에서 쓰고, 빌드/실행은 컨테이너에서. git은 맥에서 (컨테이너엔 git 없음).

## 처음 한 번: 이미지 빌드
```bash
cd ../syssec-04-examples
make image
```

## 매번: 컨테이너 열기 (syssec-labs 폴더에서)
```bash
docker run --rm -it --platform linux/amd64 --network none \
  --security-opt seccomp=unconfined -e LAB_HERE=1 \
  -v "$PWD":/home/student/lab syssec-lab-04
```
- 프롬프트가 `lab04:~/lab$`로 바뀌면 성공
- 나가기: `exit` 또는 Ctrl-D

## 트러블슈팅 기록
- `docker info`에서 Server 에러 → Docker Desktop 꺼져 있었음 → `open -a Docker`
- `--user $(id -u):$(id -g)` 넣으면 `can't cd to /home/student/lab`
  → 원인(추정): 맥 uid 501 ≠ 컨테이너 student 1000 → `--user` 빼서 해결
- platform 경고 → `--platform linux/amd64` 추가