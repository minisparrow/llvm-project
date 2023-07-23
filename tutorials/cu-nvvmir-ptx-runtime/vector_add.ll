; ModuleID = 'vector_add.cu'
source_filename = "vector_add.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

; Function Attrs: norecurse uwtable
define dso_local void @_Z24__device_stub__vectorAddPfS_S_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.dim3, align 8
  %8 = alloca %struct.dim3, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !6
  store ptr %1, ptr %5, align 8, !tbaa !6
  store ptr %2, ptr %6, align 8, !tbaa !6
  %11 = alloca [3 x ptr], align 16
  store ptr %4, ptr %11, align 16
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  store ptr %5, ptr %12, align 8
  %13 = getelementptr inbounds ptr, ptr %11, i64 2
  store ptr %6, ptr %13, align 16
  %14 = call i32 @__cudaPopCallConfiguration(ptr nonnull %7, ptr nonnull %8, ptr nonnull %9, ptr nonnull %10)
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = load i64, ptr %7, align 8
  %18 = getelementptr inbounds i8, ptr %7, i64 8
  %19 = load i32, ptr %18, align 8
  %20 = load i64, ptr %8, align 8
  %21 = getelementptr inbounds i8, ptr %8, i64 8
  %22 = load i32, ptr %21, align 8
  %23 = call noundef i32 @cudaLaunchKernel(ptr noundef nonnull @_Z24__device_stub__vectorAddPfS_S_, i64 %17, i32 %19, i64 %20, i32 %22, ptr noundef nonnull %11, i64 noundef %15, ptr noundef %16)
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr) local_unnamed_addr

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr) local_unnamed_addr

attributes #0 = { norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 6]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:minisparrow/llvm-project.git 4e6104ed337a4cf2c29e6836c3f8e1c6a5730d4b)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
