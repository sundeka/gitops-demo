# NOTE: Only for local execution
set -a
source .env
set +a

docker build \
  --build-arg GITHUB_PAT \
  --build-arg AWS_ACCESS_KEY_ID \
  --build-arg AWS_SECRET_ACCESS_KEY \
  -t tuote .
docker run -it tuote