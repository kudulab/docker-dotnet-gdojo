# docker-dotnet-gdojo

A [Dojo](https://github.com/ai-traders/dojo) docker image with graphical tools for dotnet development.
Based on [docker-dotnet-dojo](https://github.com/kudulab/docker-dotnet-dojo) image.

## Specification
All what's in [docker-dotnet-dojo](https://github.com/kudulab/docker-dotnet-dojo) and:
 * Visual Studio Code 1.27.2
 * Visual Studio Code extensions: Ionide.Ionide-FAKE, Ionide.Ionide-fsharp,
 Ionide.Ionide-Paket, ms-vscode.csharp (omnisharp-vscode)

## Usage
1. Install [Dojo](https://github.com/ai-traders/dojo)
2. Provide an Dojofile:

```
# this image is tagged as: <THIS_IMAGE_VERSION>_<BASE_IMAGE_VERSION>
DOJO_DOCKER_IMAGE="kudulab/dotnet-gdojo:3.0.0_3.1.0"
```

3. Run, example commands:

```bash
dojo
code &
```

By default current directory in docker container is `/dojo/work`.


## License

 Copyright 2019 Ewa Czechowska, Tomasz Sętkowski

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
