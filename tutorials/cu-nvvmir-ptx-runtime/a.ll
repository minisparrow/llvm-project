; ModuleID = 'vector_add-cuda-nvptx64-nvidia-cuda-sm_50.bc'
source_filename = "vector_add.cu"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @_Z9vectorAddPfS_S_(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %5 = icmp slt i32 %4, 16
  br i1 %5, label %6, label %14

6:                                                ; preds = %3
  %7 = sext i32 %4 to i64
  %8 = getelementptr inbounds float, ptr %2, i64 %7
  %9 = getelementptr inbounds float, ptr %1, i64 %7
  %10 = getelementptr inbounds float, ptr %0, i64 %7
  %11 = load float, ptr %10, align 4, !tbaa !7
  %12 = load float, ptr %9, align 4, !tbaa !7
  %13 = fadd contract float %11, %12
  store float %13, ptr %8, align 4, !tbaa !7
  br label %14

14:                                               ; preds = %6, %3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="sm_50" "target-features"="+ptx76,+sm_50" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!nvvm.annotations = !{!4}
!llvm.ident = !{!5, !6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 6]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{ptr @_Z9vectorAddPfS_S_, !"kernel", i32 1}
!5 = !{!"clang version 17.0.0 (git@github.com:minisparrow/llvm-project.git 4e6104ed337a4cf2c29e6836c3f8e1c6a5730d4b)"}
!6 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
