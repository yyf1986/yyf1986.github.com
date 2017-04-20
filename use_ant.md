```
<project name="test" default="test" basedir=".">
	<target name="debug" depends="test">
                <echo level="info">hahahha</echo>
        </target>
	<target name="test">
		<echo>hello</echo>
	</target>
</project>
```
## build.xml组成
> build.xml文件的组成是，一个根结点project,project里面包含多个target,target内含不同的task。

#### project
* name     项目名称
* default  默认执行target
* basedir  基础路径
#### target
|属性|说明|Required|
|-|-|-|
|name|target的名字|Y|
|depends|需要依赖的其他target|N|
|description|关于target功能的简短描述|N|
|if|为了执行本target而被设置的属性的名字|N|
|unless|为了执行本target而不被设置的属性的名字|N|

#### 常用的task
* mkdir
```
<mkdir dir="build/classes"/>
<target name="init">
　  <mkdir dir="${dist.dir}" />
    <mkdir dir="${dist.classes.dir}" />
    <mkdir dir="${dist.webapps.dir}" />
</target>
```
* delete 
```
<delete includeEmptyDirs="true">
    <fileset dir="${build}"/>
</delete>
<target name="clean" description="clean up" >
    <delete dir="${build}"/>
    <delete dir="${dist}"/>
</target>
```
* copy 
```
<copy file="file" tofile="file.bak"/>
<copy file="config.xml" todir="${dist.classes.dir}"/>
<copy todir="${targetdir}">
    <fileset dir="${sourcedir}"/>
</copy>
<target name="copy-resources" depends="clean">
    <copy todir="${targetdir}">
        <fileset dir="${sourcedir}">
             <exclude name="**/**/*.java" />
        </fileset>
    </copy>
</target>
```
* move
```
<move file="file" tofile="file.bak"/>
<move todir="${targetdir}">
    <fileset dir="${sourcedir}"/>
</move>
<move todir="${targetdir}">
    <fileset dir="${sourcedir}">
        <include name="**/**/*.java" />
    </fileset>
</move>
```
* compile
```
<path id="libraries">
    <fileset dir="${libdir}">
        <include name="*.jar" />
    </fileset>
</path>
<target name="compile" depends="copy-resources">
    <javac srcdir="${sourcedir}"
                   destdir="${targetdir}"
                   classpathref="libraries" />
    <jar destfile="${jardir}/my.jar" basedir="${targetdir}"/>
</target>
```
* jar
```
<jar destfile="${jardir}/my.jar" basedir="${targetdir}"/>
<jar destfile="${dist}/lib/app.jar">
    <fileset dir="${build}/classes"
        　　 excludes="**/Test.class"/>
    <fileset dir="${src}/resources"/>
</jar>
```
## 使用技巧
- 调用操作系统环境变量
在project最前面
`<property environment="SystemVariable"/>`
- 调用
`${SystemVariable.abc}`
